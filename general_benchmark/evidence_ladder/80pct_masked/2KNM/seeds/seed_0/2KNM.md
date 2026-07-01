# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2KNM/sequence/2KNM.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/2KNM/seeds/seed_0/2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 4.912 A
- tm_score_ca_ordered: 0.10729289238891504
- heavy_atom_rmsd: 5.564 A
- sidechain_heavy_atom_rmsd: 6.205 A
- **all-atom quality (honest):** heavy 5.564 A, sidechain 6.205 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 65
- bin_accuracy: 0.338

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=rejected_lj_regression tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.912001301958539
- ga_delta_rmsd: 0.5302059540556527  ga_fitness_mode: energy
- pre_local_rmsd: 4.911954260676317  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** S23-V25 → 8 conflicts (67%)
- explained: 8/12 conflicts by 1 root cause(s)
- metrics: hubs=7 (frac 0.25), conflicts/hub=1.7, max_incompat=5.31Å, chain_span=0.643
- **fix-first:** [LOW_CONFLICT] Root cause(s): S23-V25 — explain ~8/12 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I17** — severity 7.58, 4 conflict(s); suspect input ~`S20` (group: push_out)
  - push-out (wants farther): V8@19.4Å(now 12.2,conf 0.57), S23@18.0Å(now 7.3,conf 0.55), C21@12.6Å(now 8.9,conf 0.55), S6@15.5Å(now 11.8,conf 0.55)
  - S23↔S20: targets 18.0/9.1Å but partners are 3.6Å apart → too_close_together by 5.3Å
  - S23↔R28: targets 18.0/8.0Å but partners are 4.9Å apart → too_close_together by 5.1Å
  - S23↔Y27: targets 18.0/10.2Å but partners are 6.0Å apart → too_close_together by 1.8Å
- **V8** — severity 4.22, 3 conflict(s); suspect input ~`V25` (group: push_out)
  - push-out (wants farther): I17@19.4Å(now 12.2,conf 0.57), I1@17.5Å(now 6.8,conf 0.55), S14@14.7Å(now 9.9,conf 0.55), C3@14.0Å(now 6.6,conf 0.55)
  - I17↔V25: targets 19.4/7.8Å but partners are 8.4Å apart → too_close_together by 3.1Å
  - S14↔V25: targets 14.7/7.8Å but partners are 4.0Å apart → too_close_together by 3.0Å
  - I1↔V25: targets 17.5/7.8Å but partners are 8.1Å apart → too_close_together by 1.6Å
- **S14** — severity 2.21, 1 conflict(s); suspect input ~`E5` (group: push_out)
  - push-out (wants farther): V8@14.7Å(now 9.9,conf 0.55), C7@11.5Å(now 5.4,conf 0.55)
  - V8↔E5: targets 14.7/7.8Å but partners are 2.9Å apart → too_close_together by 4.0Å
- **C7** — severity 1.49, 1 conflict(s); suspect input ~`S23` (group: push_out)
  - push-out (wants farther): A16@15.0Å(now 9.3,conf 0.55), I1@14.6Å(now 6.0,conf 0.55), S14@11.5Å(now 5.4,conf 0.55), G4@9.7Å(now 4.4,conf 0.55), Y27@10.1Å(now 7.3,conf 0.55)
  - A16↔S23: targets 15.0/8.7Å but partners are 3.6Å apart → too_close_together by 2.7Å
- **S6** — severity 1.45, 1 conflict(s); suspect input ~`I17` (group: push_out)
  - push-out (wants farther): I17@15.5Å(now 11.8,conf 0.55)
  - C12↔I17: targets 7.3/15.5Å but partners are 5.5Å apart → too_close_together by 2.7Å
- **C19** — severity 1.13, 1 conflict(s); suspect input ~`K24` (group: push_out)
  - push-out (wants farther): K24@12.1Å(now 6.2,conf 0.55)
  - S14↔K24: targets 5.2/12.1Å but partners are 4.9Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=8 · 3-10(G)=4 · coil(C)=2

```
CEHHHHHGCEEGHHEHHEHGHHHGHEEE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=5 · sheet=19
  - C3 ↔ C7  (helix)
  - I13 ↔ I17  (helix)
  - I17 ↔ C21  (helix)
  - C19 ↔ S23  (helix)
  - C21 ↔ V25  (helix)
  - P2 ↔ I10  (sheet)
  - P2 ↔ P11  (sheet)
  - P2 ↔ S15  (sheet)
  - P2 ↔ G18  (sheet)
  - I10 ↔ S15  (sheet)
  - I10 ↔ G18  (sheet)
  - I10 ↔ C26  (sheet)
  - I10 ↔ Y27  (sheet)
  - I10 ↔ R28  (sheet)
  - P11 ↔ G18  (sheet)
  - P11 ↔ C26  (sheet)
  - P11 ↔ Y27  (sheet)
  - P11 ↔ R28  (sheet)
  - S15 ↔ C26  (sheet)
  - S15 ↔ Y27  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=8 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=186 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=105 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.1115 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
