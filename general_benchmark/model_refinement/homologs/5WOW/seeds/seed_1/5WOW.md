# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\5WOW\seeds\seed_1\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 4.313 A
- tm_score_ca_ordered: 0.3265240036226808
- heavy_atom_rmsd: 5.372 A
- sidechain_heavy_atom_rmsd: 6.282 A
- **all-atom quality (honest):** heavy 5.372 A, sidechain 6.282 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 278
- bin_accuracy: 0.662

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=5.310117443117212 -> 4.397672158852564 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.312628618123702
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 4.312719154651928  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** S14 → 5 conflicts (100%)
- explained: 5/5 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.108), conflicts/hub=1.2, max_incompat=3.72Å, chain_span=0.081
- **fix-first:** [LOW_CONFLICT] Root cause(s): S14 — explain ~5/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V2** — severity 2.00, 2 conflict(s); suspect input ~`S14` (group: push_out)
  - push-out (wants farther): S14@15.0Å(now 11.8,conf 0.34)
  - C20↔S14: targets 7.3/15.0Å but partners are 4.2Å apart → too_close_together by 3.5Å
  - A19↔S14: targets 5.5/15.0Å but partners are 7.2Å apart → too_close_together by 2.3Å
- **C3** — severity 1.26, 1 conflict(s); suspect input ~`S14` (group: push_out)
  - push-out (wants farther): G18@5.8Å(now 3.2,conf 0.42), S14@13.1Å(now 10.1,conf 0.34)
  - C20↔S14: targets 5.2/13.1Å but partners are 4.2Å apart → too_close_together by 3.7Å
- **K5** — severity 1.20, 1 conflict(s); suspect input ~`C20` (group: pull_in)
  - pull-in (wants closer): N25@15.6Å(now 18.1,conf 0.34)
  - push-out (wants farther): S14@17.0Å(now 14.1,conf 0.35)
  - S14↔C20: targets 17.0/9.4Å but partners are 4.2Å apart → too_close_together by 3.5Å
- **P4** — severity 1.11, 1 conflict(s); suspect input ~`S14` (group: push_out)
  - push-out (wants farther): S14@14.8Å(now 12.1,conf 0.34)
  - C20↔S14: targets 7.4/14.8Å but partners are 4.2Å apart → too_close_together by 3.3Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=15 · 3-10(G)=4 · coil(C)=2

```
EHGEEEHGHHHEEHHEEECEEGGHEEECHHHHHHHHE
```

## Backbone H-bond Network

- total=51 · helix(i→i+4)=6 · sheet=45
  - L7 ↔ R11  (helix)
  - R11 ↔ D15  (helix)
  - G29 ↔ D33  (helix)
  - Y30 ↔ V34  (helix)
  - P31 ↔ P35  (helix)
  - Y32 ↔ D36  (helix)
  - G1 ↔ D13  (sheet)
  - G1 ↔ C16  (sheet)
  - G1 ↔ P17  (sheet)
  - G1 ↔ G18  (sheet)
  - G1 ↔ C20  (sheet)
  - G1 ↔ I21  (sheet)
  - P4 ↔ C16  (sheet)
  - P4 ↔ P17  (sheet)
  - P4 ↔ G18  (sheet)
  - P4 ↔ C20  (sheet)
  - P4 ↔ I21  (sheet)
  - K5 ↔ C16  (sheet)
  - K5 ↔ P17  (sheet)
  - K5 ↔ G18  (sheet)
  - … +31 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=231 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=157 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2602 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
