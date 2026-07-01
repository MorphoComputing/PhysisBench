# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\5WOW\seeds\seed_1\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 0.554 A
- tm_score_ca_ordered: 0.9064449095414431
- heavy_atom_rmsd: 2.917 A
- sidechain_heavy_atom_rmsd: 3.931 A
- **all-atom quality (honest):** heavy 2.917 A, sidechain 3.931 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 595
- bin_accuracy: 0.639

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=0.7214560681627897 -> 0.5535218047344237 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5536036702597567
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5535333335634434  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C28-D33 → 6 conflicts (100%)
- explained: 6/6 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.135), conflicts/hub=1.2, max_incompat=3.6Å, chain_span=0.622
- **fix-first:** [LOW_CONFLICT] Root cause(s): C28-D33 — explain ~6/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C10** — severity 1.53, 2 conflict(s); suspect input ~`Y30` (group: push_out)
  - push-out (wants farther): Y30@13.4Å(now 10.8,conf 0.34)
  - C28↔Y30: targets 5.0/13.4Å but partners are 5.8Å apart → too_close_together by 2.7Å
  - G29↔Y30: targets 7.8/13.4Å but partners are 3.7Å apart → too_close_together by 1.8Å
- **G24** — severity 1.23, 1 conflict(s); suspect input ~`Y30` (group: push_out)
  - push-out (wants farther): P31@17.4Å(now 14.4,conf 0.35)
  - Y30↔P31: targets 9.8/17.4Å but partners are 3.9Å apart → too_close_together by 3.6Å
- **C28** — severity 0.95, 1 conflict(s); suspect input ~`D33` (group: push_out)
  - push-out (wants farther): D33@15.4Å(now 12.7,conf 0.34)
  - D33↔P31: targets 15.4/7.1Å but partners are 5.5Å apart → too_close_together by 2.8Å
- **P31** — severity 0.64, 1 conflict(s); suspect input ~`R23` (group: push_out)
  - push-out (wants farther): G24@17.4Å(now 14.4,conf 0.35)
  - G24↔R23: targets 17.4/11.8Å but partners are 3.7Å apart → too_close_together by 1.9Å
- **D33** — severity 0.57, 1 conflict(s); suspect input ~`C28` (group: push_out)
  - push-out (wants farther): C28@15.4Å(now 12.7,conf 0.34)
  - C28↔L7: targets 15.4/6.9Å but partners are 6.9Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=15 · 3-10(G)=6 · coil(C)=5

```
CGGHEECECGHEHHHEHEHCEEEHHGEEGCEGHEHEE
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=2 · sheet=37
  - R11 ↔ D15  (helix)
  - D15 ↔ A19  (helix)
  - K5 ↔ C16  (sheet)
  - K5 ↔ G18  (sheet)
  - K5 ↔ I21  (sheet)
  - I6 ↔ C16  (sheet)
  - I6 ↔ G18  (sheet)
  - Q8 ↔ C16  (sheet)
  - Q8 ↔ G18  (sheet)
  - Q8 ↔ I21  (sheet)
  - Q8 ↔ C22  (sheet)
  - Q8 ↔ R23  (sheet)
  - Q8 ↔ Y27  (sheet)
  - Q8 ↔ C28  (sheet)
  - R12 ↔ I21  (sheet)
  - R12 ↔ C22  (sheet)
  - R12 ↔ R23  (sheet)
  - R12 ↔ Y27  (sheet)
  - R12 ↔ C28  (sheet)
  - C16 ↔ I21  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=128 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=66 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2129 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
