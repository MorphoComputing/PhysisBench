# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1HVZ/sequence/1HVZ.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1HVZ/seeds/seed_1/1HVZ.pdb`
- residues: 16
- mode: oracle
- ca_rmsd: 4.225 A
- tm_score_ca_ordered: 0.09165117148969879
- heavy_atom_rmsd: 6.157 A
- sidechain_heavy_atom_rmsd: 7.409 A
- **all-atom quality (honest):** heavy 6.157 A, sidechain 7.409 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 18
- bin_accuracy: 0.444

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=12
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=118 mode=rotamer
- phase_b_ca_rmsd_after: 4.2247746068492855
- ga_delta_rmsd: 1.6678512835607835  ga_fitness_mode: energy
- pre_local_rmsd: 4.224680402488673  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C6-R8 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.125), conflicts/hub=1.5, max_incompat=3.8Å, chain_span=0.75
- **fix-first:** [LOW_CONFLICT] Root cause(s): C6-R8 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I14** — severity 3.55, 2 conflict(s); suspect input ~`C11` (group: push_out)
  - push-out (wants farther): R8@16.3Å(now 10.4,conf 0.55)
  - R8↔C11: targets 16.3/9.6Å but partners are 2.9Å apart → too_close_together by 3.8Å
  - R8↔C6: targets 16.3/10.3Å but partners are 3.3Å apart → too_close_together by 2.7Å
- **C2** — severity 1.07, 1 conflict(s); suspect input ~`R7` (group: push_out)
  - push-out (wants farther): R7@14.6Å(now 7.1,conf 0.55)
  - C15↔R7: targets 4.3/14.6Å but partners are 8.3Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=6 · strand(E)=5 · 3-10(G)=1 · coil(C)=4

```
CEEHCHHEHHCCEGHE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=1 · sheet=8
  - C6 ↔ V10  (helix)
  - C2 ↔ R8  (sheet)
  - C2 ↔ C13  (sheet)
  - C2 ↔ T16  (sheet)
  - R3 ↔ R8  (sheet)
  - R3 ↔ C13  (sheet)
  - R3 ↔ T16  (sheet)
  - R8 ↔ C13  (sheet)
  - R8 ↔ T16  (sheet)

## Solvent Accessibility (burial)

- buried=5 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=62 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=28 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.8162 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
