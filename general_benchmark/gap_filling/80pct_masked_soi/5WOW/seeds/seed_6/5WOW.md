# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\5WOW\seeds\seed_6\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 3.503 A
- tm_score_ca_ordered: 0.3656992625988361
- heavy_atom_rmsd: 5.108 A
- sidechain_heavy_atom_rmsd: 6.315 A
- **all-atom quality (honest):** heavy 5.108 A, sidechain 6.315 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.027
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 248
- bin_accuracy: 0.665

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=3.9119642636014604 -> 3.124885668866829 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.5027129208597594
- ga_delta_rmsd: -0.5619842967320547  ga_fitness_mode: energy
- pre_local_rmsd: 3.502656887886997  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C20-C22 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.081), conflicts/hub=1.0, max_incompat=3.08Å, chain_span=0.243
- **fix-first:** [LOW_CONFLICT] Root cause(s): C20-C22 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C20** — severity 1.70, 1 conflict(s); suspect input ~`C28` (group: push_out)
  - push-out (wants farther): Y27@10.6Å(now 7.7,conf 0.79), K5@8.8Å(now 5.5,conf 0.55)
  - Y27↔C28: targets 10.6/5.9Å but partners are 1.6Å apart → too_close_together by 3.1Å
- **I21** — severity 1.27, 1 conflict(s); suspect input ~`Y27` (group: push_out)
  - push-out (wants farther): C16@5.8Å(now 3.2,conf 0.55), Y27@8.5Å(now 5.2,conf 0.55)
  - C28↔Y27: targets 4.6/8.5Å but partners are 1.6Å apart → too_close_together by 2.3Å
- **G29** — severity 1.18, 1 conflict(s); suspect input ~`C22` (group: push_out)
  - pull-in (wants closer): C22@5.8Å(now 8.5,conf 0.69)
  - push-out (wants farther): Q8@8.4Å(now 5.5,conf 0.55)
  - V34↔C22: targets 10.9/5.8Å but partners are 18.4Å apart → too_far_apart by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=13 · 3-10(G)=6 · coil(C)=6

```
ECGHECEEECHEHEGHHHHGCGCHHGEHECEEHGEHE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=2 · sheet=16
  - D13 ↔ P17  (helix)
  - G24 ↔ C28  (helix)
  - G1 ↔ L7  (sheet)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ R9  (sheet)
  - L7 ↔ Y27  (sheet)
  - Q8 ↔ S14  (sheet)
  - Q8 ↔ Y27  (sheet)
  - R9 ↔ S14  (sheet)
  - R9 ↔ Y27  (sheet)
  - R9 ↔ G29  (sheet)
  - R12 ↔ Y27  (sheet)
  - R12 ↔ G29  (sheet)
  - S14 ↔ Y27  (sheet)
  - Y27 ↔ Y32  (sheet)
  - G29 ↔ Y37  (sheet)
  - P31 ↔ Y37  (sheet)
  - Y32 ↔ Y37  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=142 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=80 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4557 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.027

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
