# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1VII\seeds\seed_3\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.373 A
- tm_score_ca_ordered: 0.4464504835773166
- heavy_atom_rmsd: 3.994 A
- sidechain_heavy_atom_rmsd: 4.962 A
- **all-atom quality (honest):** heavy 3.994 A, sidechain 4.962 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 219
- bin_accuracy: 0.703

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=3.584100566164577 -> 2.5102270953171826 A
- topology_reconvergence: applied=True accepted=7/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.372566545548008
- ga_delta_rmsd: -0.95905777610702  ga_fitness_mode: energy
- pre_local_rmsd: 2.3725101803122195  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.059), conflicts/hub=1.0, max_incompat=2.08Å, chain_span=0.029
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L1** — severity 1.70, 1 conflict(s); suspect input ~`D5` (group: pull_in)
  - pull-in (wants closer): A8@6.7Å(now 9.3,conf 0.67)
  - push-out (wants farther): E4@9.0Å(now 4.8,conf 0.99), D5@8.8Å(now 5.8,conf 0.82)
  - K7↔D5: targets 5.1/8.8Å but partners are 1.6Å apart → too_close_together by 2.1Å
- **S2** — severity 1.64, 1 conflict(s); suspect input ~`D5` (group: push_out)
  - push-out (wants farther): D5@8.7Å(now 3.9,conf 0.82)
  - K7↔D5: targets 5.1/8.7Å but partners are 1.6Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=14 · 3-10(G)=4 · coil(C)=6

```
CEHHEHGGEECECEHHHEHEEEGEGCHCEHEEHC
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=1 · sheet=24
  - S15 ↔ N19  (helix)
  - S2 ↔ V9  (sheet)
  - S2 ↔ F10  (sheet)
  - S2 ↔ M12  (sheet)
  - S2 ↔ R14  (sheet)
  - D5 ↔ F10  (sheet)
  - D5 ↔ M12  (sheet)
  - D5 ↔ R14  (sheet)
  - V9 ↔ R14  (sheet)
  - V9 ↔ K29  (sheet)
  - F10 ↔ A18  (sheet)
  - F10 ↔ K29  (sheet)
  - M12 ↔ A18  (sheet)
  - M12 ↔ K32  (sheet)
  - R14 ↔ L20  (sheet)
  - R14 ↔ K29  (sheet)
  - R14 ↔ E31  (sheet)
  - R14 ↔ K32  (sheet)
  - A18 ↔ K24  (sheet)
  - A18 ↔ K29  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=111 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=22 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3684 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
